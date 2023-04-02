# Progress Protocol Smart Contract

Progress protocol es un protocolo que permite trackear tu progreso en los cursos.

## Network

Polygon Mumbia (Testnet) [here](https://mumbai.polygonscan.com/) 

Smart Contract [here](https://mumbai.polygonscan.com/address/0x98D5110CDBeF8Cdd16693127671b5351bcF9B57E)

```shell
0x98D5110CDBeF8Cdd16693127671b5351bcF9B57E
```

## IPFS

Metada [here](https://ipfs.io/ipfs/QmTJQq9sntfhrXvdQSWfopvN59gSP7PaHjpKyyiXVhiGcn/)

## Language

Solidity 8.0.1 [here](https://docs.soliditylang.org/en/v0.8.1/)


# APIs: Alumno

# safeMint (Inscribirse a un curso)

```http
safeMint(address)
```
### Request

```sodlity
{
  "address" : address
}
```

El atributo `address` es la direccion del alumno, al que se le minteara el nft (incripcion al curso)


# upLevel (Subir al siguiente Nivel en un curso) (OnlyOwner)

```http
upLevel(address)
```
### Request

```sodlity
{
  "address" : address
}
```

El atributo `address` es la direccion del alumno, al que se le subira al siguiente nivel del curso


# APIs: Administrador del curso

# setLevelURI (Cambiar la metadata para un un nivel del curso)

```http
upLevel(uint256, string)
```
### Request

```sodlity
{
  "_level": uint256,
  "_UIR": string
}
```

El atributo `_level` es el nivel del curso al cual se le cambiara la metadata

El atributo `_UIR` es el nuevo URI de la metadata del curso


## Comdandos utiles

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.ts
```
