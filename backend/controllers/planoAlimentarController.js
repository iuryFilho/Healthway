const db = require('../firebase-config');
const PlanoAlimentar = require('../model/PlanoAlimentar');

const planoAlimentarController = {
    // Criar um plano alimentar
    async create(req, res) {
        try {
            const planoAlimentar = new PlanoAlimentar(req.body);
            await db.collection('plano_alimentar').add(planoAlimentar.toFirestore());
            res.status(201).json({ message: 'Plano alimentar criado com sucesso!' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    // Obter todos os planos alimentares
    async getAll(req, res) {
        try {
            const snapshot = await db.collection('plano_alimentar').get();
            const planosAlimentares = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
            res.status(200).json(planosAlimentares);
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    // Obter um plano alimentar pelo ID
    async getById(req, res) {
        try {
            const { id } = req.params;
            const doc = await db.collection('plano_alimentar').doc(id).get();

            if (!doc.exists) {
                return res.status(404).json({ error: 'Plano alimentar não encontrado.' });
            }

            res.status(200).json({ id: doc.id, ...doc.data() });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    // Atualizar um plano alimentar
    async update(req, res) {
        try {
            const { id } = req.params;
            const planoAlimentar = new PlanoAlimentar(req.body);

            await db.collection('plano_alimentar').doc(id).update(planoAlimentar.toFirestore());
            res.status(200).json({ message: 'Plano alimentar atualizado com sucesso!' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    // Excluir um plano alimentar
    async delete(req, res) {
        try {
            const { id } = req.params;
            await db.collection('plano_alimentar').doc(id).delete();
            res.status(200).json({ message: 'Plano alimentar excluído com sucesso!' });
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    // Obter um plano alimentar de um paciente passando o seu id como parâmetro
    async getByPaciente(req, res) {
        try {
            const { paciente } = req.params;

            if (!paciente) {
                return res.status(400).json({ error: 'O parâmetro paciente é obrigatório.' });
            }

            const snapshot = await db.collection('plano_alimentar')
                                        .where('id_paciente', '==', paciente)
                                        .get();

            if (snapshot.empty) {
                return res.status(404).json({ message: 'Nenhum plano alimentar encontrado para este paciente.' });
            }

            const planos = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
            
            res.status(200).json(planos);

        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    },

    async getByNutricionista (req, res) {
        try {
            const { nutricionista } = req.params;

            if (!nutricionista) {
                return res.status(400).json({ error: 'O parâmetro nutricionista é obrigatório.' });
            }

            const snapshot = await db.collection('plano_alimentar')
                                        .where('id_nutricionista', '==', nutricionista)
                                        .get();

            if (snapshot.empty) {
                return res.status(404).json({ message: 'Nenhum plano alimentar encontrado para este nutricionista.' });
            }

            const planos = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));

            return res.status(200).json(planos);

        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    }
};

module.exports = planoAlimentarController;
