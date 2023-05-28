module.exports = ({ env }) => ({
    upload: {
        provider: 'local',
        providerOptions: {
            basePath: 'assets',
            maxFileSize: 100 * 1024 * 1024
        },
    },
});