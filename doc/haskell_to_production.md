# Haskell to production

## Sprint 2 (28 Jun 2021 - 05 Jul 2021)
- [ ] Command line interface to interact with the business logic (battleship engine)
  - [x] engine
  - [x] client
  - [ ] optparse-alternative data types as lenses
  - [ ] use lenses/optics to get useful information from CLI options.
  - [ ] Maybe handling in optparse alternative and use lenses to apply the default alternative
  - [ ] clean out the garbage out of the cli options
- [ ] TMP kafka integration + optparse integration
- [ ] Add the app options in the RIO reader

  > Note: Address the commands issue by applying [this fix](https://stackoverflow.com/questions/59722106/subcommand-help-using-optparse-applicative)
- [x] Simple logging

## Next sprints

- [ ] Handling RIO reader with the optics/lenses
- [ ] database (with sqlite) integration
- [ ] kafka integration
- [ ] engine implementation
- [ ] REST service integration
- [ ] REST client integration
- [ ] Parallelism and concurrency
- [ ] [Optional] Cassandra integration

## Backlog
### See below the application development lifecycle phases and associated technologies/libraries.

1. [ ] [a] Haskell idioms as much as possible (applied incrementally)
   - [ ] [b] Usage of some advances FP technics
   - [ ] [a] Handling exceptions/errors
2. [ ] [a] Use the right Prelude replacement
3. [ ] [a] Data type based business domain
4. [ ] Logging
   - [ ] [a] Local (file) logging
   - [ ] [b] Centralized logging
5. [ ] [a] JSON (de)serialization
6.  [ ] Expose the interactions with engine by:
   - [ ] [a] HTTP RESTful microservices
   - [ ] [b] Messaging (Kafka)
10. [ ] [b] Concurrency
11. [ ] [b] Reactive Manifest/Streams
12. [ ] Tracing
   - [ ] [b] Centralized tracing for HTTP(s) RESTful services
13. [ ] [b] Service Registration and Discovery
14. [ ] Persistence
   - [ ] [a] RDBMS: PostgreSQL
   - [ ] [b] NoSQL: Cassandra
15. [ ] Testing in Haskell
    - [ ] [a] Unit testing
    - [ ] [a] Integration testing
    - [ ] [b] e2e testing
    - [ ] [b] Performance testing (profile)
16. [ ] Security
    - [ ] [b] HTTPS RESTful services (certificate)
    - [ ] [b] AccessToken (JWT)
    - [ ] [b] Encrypted (Kafka) messages
    - [ ] [b] ACL (roles)
17. [ ] Web Application
   - [ ] [b] FP/Haskell variant
   - [ ] [b] SSE
18. [ ] Pipeline (AzureDevOps or Github)
   - [ ] [b] Application as docker image
   - [ ] [b] Application installed in kubernetes containers (minikube)
   - [ ] [b] Application build and release with pipelines
19. [ ] [b] Alerting support (Incidents management)
20. [ ] [b] Function design and architecture. Glue everything together.
   Books:
   - Functional   Design and   Architecture by Alexander   Granin
   - Haskell in Depth by VITALY BRAGILEVSKY
21. [ ] [ ] Risks:
   - [ ] How security flows in used libraries are handled by the community/ecosystem


## Failed/later
1. [ ] Multi package / multi module application

## Finished sprints
  - [x] Sprint 1 (16 Jun 2021)
    - [x] [a] Create the project (structure) - one lib and one executable
    - [x] [a] Use RIO instead of Prelude module
    - [x] [a] Create the [domain model](./architecture_design.md#domain-model))





## Previous sprints
- [x] [a] Install the haskell platform and create the project structure
- [x] [a] Install haskell stack
- [x] [a] Install and configure the VS Code Haskell extension (Haskell Language Server)
