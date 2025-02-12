# RAG Chatbot avec n8n

Ce projet présente la mise en œuvre d'un chatbot RAG (Retrieval Augmented Generation) en utilisant n8n, un outil d'automatisation des flux de travail visuels. Le chatbot est conçu pour répondre à des questions spécifiques à partir de sources de données externes comme des spécifications API, des documents internes, ou d'autres sources structurées ou non structurées.

## Vue d'ensemble du projet

Ce projet propose deux workflows qui intègrent la logique d'un chatbot alimenté par l'IA et le stockage des embeddings de documents avec Pinecone.

- **Workflow 1 : Construire la logique de base du chatbot**  
  Ce workflow configure un chatbot intelligent utilisant le modèle OpenAI GPT-4, intègre un tampon mémoire et traite les requêtes des utilisateurs en exploitant l'API GitHub basée sur les spécifications OpenAPI v3.
  
- **Workflow 2 : Sauvegarder les documents et leurs embeddings dans le Pinecone vector store**  
  Ce workflow est conçu pour charger, traiter et stocker les embeddings des documents dans Pinecone. Il prend en charge l'extraction de contenu, la découpe de texte, et l'utilisation des embeddings OpenAI pour alimenter le vector store pour les requêtes futures.

---

## Workflow 1 : Construire la logique de base du chatbot

### Description
Ce workflow met en place un agent IA capable de répondre aux requêtes des utilisateurs. Il traite les messages entrants, génère des réponses à l'aide du modèle OpenAI GPT-4 et stocke les embeddings pertinents dans Pinecone pour améliorer la précision des réponses. Le workflow utilise le framework LangChain pour gérer les tâches de traitement du langage naturel.


## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants en place :

- **n8n** : Vous aurez besoin d'un compte n8n pour créer et exécuter des flux de travail. Si vous ne l'avez pas déjà, vous pouvez créer un compte sur [n8n.cloud](https://n8n.io/).
- **OpenAI API** : Pour la génération des embeddings et des réponses, vous aurez besoin d'un compte OpenAI et d'une clé API. Vous pouvez obtenir une clé API depuis [OpenAI](https://platform.openai.com/).
- **Pinecone API** : Vous aurez besoin d'un compte Pinecone et d'une clé API pour gérer la base de données vectorielle (vector store). Créez un compte sur [Pinecone](https://www.pinecone.io/).
- **Données API** : Dans cet exemple, nous utilisons la spécification OpenAPI de GitHub, mais vous pouvez adapter le flux de travail pour n'importe quelle source de données.

## Installation

1. **Créer un compte n8n** :
   - Allez sur [n8n.io](https://n8n.io/) et inscrivez-vous.
   - Si vous préférez héberger n8n localement, suivez la [documentation d'installation de n8n](https://n8n.io/docs/).

2. **Créer un compte OpenAI** :
   - Allez sur [OpenAI](https://platform.openai.com/) et inscrivez-vous.
   - Créez une clé API et conservez-la pour plus tard.

3. **Créer un compte Pinecone** :
   - Allez sur [Pinecone](https://www.pinecone.io/) et inscrivez-vous.
   - Créez une clé API pour accéder à Pinecone.

## Configuration de n8n

1. **Importer le flux de travail** :
   - Une fois votre compte n8n configuré, importez le flux de travail fourni dans n8n à partir du lien de partage ou de fichier exporté.

2. **Configurer les nœuds API** :
   - Dans n8n, vous devez configurer les nœuds suivants pour interagir avec les API :
     - **HTTP Request** pour récupérer la spécification OpenAPI de GitHub.
     - **Pinecone Vector Store** pour stocker les embeddings dans la base de données vectorielle.
     - **OpenAI Embeddings** pour générer des embeddings à partir de votre texte.
     - **AI Agent** pour coordonner la récupération de données et la génération de réponses.

3. **Configurer la mémoire et les outils de récupération** :
   - Utilisez le **Window Buffer Memory** pour garder un historique de la conversation.
   - Connectez le nœud **Vector Store Tool** à l'agent d'IA pour effectuer la recherche sémantique dans la base de données vectorielle et récupérer les informations pertinentes.


## Utilisation du Chatbot

Une fois le flux de travail configuré, vous pouvez tester votre chatbot en envoyant une requête, par exemple :


Le chatbot répondra en récupérant les informations pertinentes de la spécification OpenAPI de GitHub et en générant une réponse détaillée.

## Étapes de construction du flux de travail

1. **Chargement des données** : Utilisez un nœud `HTTP Request` pour récupérer la spécification OpenAPI de GitHub. Vous pouvez adapter ce nœud pour obtenir d'autres types de documents ou API.
2. **Génération des embeddings** : Les nœuds OpenAI sont utilisés pour transformer le texte en embeddings vectoriels.
3. **Stockage des données** : Les embeddings sont stockés dans Pinecone pour une récupération rapide.
4. **Interrogation de l'API et génération des réponses** : Lorsqu'un utilisateur pose une question, le chatbot recherche des documents similaires dans Pinecone et génère une réponse avec OpenAI.
5. **Test du chatbot** : Vous pouvez tester le chatbot directement depuis l'interface n8n pour vérifier que tout fonctionne correctement.

## Améliorations possibles

- **Ajouter plus de sources de données** : Vous pouvez connecter d'autres bases de données ou services API pour enrichir les connaissances du chatbot.
- **Fine-tuning des prompts** : Expérimentez avec différents modèles et ajustez les invites pour affiner la qualité des réponses.
- **Utilisation de LangChain** : Explorez l'intégration de LangChain avec n8n pour des flux de travail plus complexes et personnalisés.

## Ressources

- [Documentation officielle de n8n](https://n8n.io/docs/)
- [OpenAI API Documentation](https://platform.openai.com/docs/)
- [Pinecone API Documentation](https://www.pinecone.io/docs/)

## Auteurs

- **Gautier Esam** : Mainteneur du projet.

## License

Ce projet est sous licence MIT.
