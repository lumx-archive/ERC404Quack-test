## Repositório referente ao Purple Brain ERC404 da Lumx.
## O material e smart contract aqui expostos tem fins exclusivamente educacionais. Nada aqui deve ser replicado em projetos reais sem o processo de auditoria.

## Entre na nossa comunidade [Discord](https://discord.gg/qUPnv5EvqZ).
## Caso seja uma empresa e queira usar nosso procolo, veja nossas soluções no site [Lumx.io](https://www.lumx.io/pt)

## Nossa collection: [QuackLumxDN404](https://testnets.opensea.io/collection/quacklumxdn404)

### Use o repositorio:
```shell
$ git clone https://github.com/Lume-Studios/ERC404Quack-test
$ cd ERC404Quack-test
```

### script de instalacao das bibliotecas:
```shell
$ forge install
```

### script de teste dos contratos pelo foundry:
```shell
$ forge test -vvvv
```

### script de gas report contratos pelo foundry:
```shell
$ forge test --gas-report
```

### script de deploy DN404:

```shell
$ forge script script/DeployDN404.s.sol:Deploy --rpc-url mumbai --private-key <PRIVATE_KEY> --broadcast
```
### script de deploy exemplo PANDORA:

```shell
$ forge script script/Deploy.s.sol:DeploySimpleERC404 --rpc-url mumbai --private-key <PRIVATE_KEY> --broadcast
```


## Smart Contracts:

```txt
src
├─ LumxQuack — Contrato usando o ERC404simple que usamos durante o workshop e usado no projeto da Pandora.
├─ LumxQuackAdv — Contrato usando o ERC404advanced mais complexo e atualizado retirado do repositorio da Pandora
└─ DN404 — Contrato mais avançado e mais eficiênte explicado durante workshop. 
```

**Foundry instrucoes basicas abaixo:**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
