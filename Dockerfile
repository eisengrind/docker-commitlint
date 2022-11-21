
FROM node:lts-slim

RUN npm install -g @commitlint/cli @commitlint/config-conventional

ENTRYPOINT [ "commitlint" ]
