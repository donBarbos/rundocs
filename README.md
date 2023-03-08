# rundocs

| Script that runs code blocks in markdown |
| ---------------------------------------- |

## Installation

- ### Use git:

  1. Clone this repo: `git clone https://github.com/donBarbos/rundocs.git`
  2. Start script: `./run_code_blocks.sh $FILENAME.md`

- ### Use wget:

  1. Install script: `wget https://raw.githubusercontent.com/donBarbos/rundocs/main/run_code_blocks.sh`
  2. change the permissions: `chmod +x run_code_blocks.sh`
  3. Start script: `./run_code_blocks.sh $FILENAME.md`

## Usage

The first and so far the only argument is the path to the markdown file with code blocks.

```bash
# use case
./run_code_blocks.sh example.md
```

## License

Distributed under the AGPL-3.0 license. See [`LICENSE`](./LICENSE) for more information.

## Contact

[donbarbos](https://github.com/donBarbos): donbarbos@proton.me
