1. data/
   •	models/ — DTO-модели, маппинг к JSON (с API / Firebase).
   •	datasources/ — доступ к данным: API, Firebase, локалка.
   •	repositories_impl/ — реализация domain.repositories.

2. domain/
   •	entities/ — бизнес-модели без зависимости от внешних библиотек.
   •	repositories/ — абстрактные интерфейсы (например, AccreditationRepository).
   •	usecases/ — классы, реализующие бизнес-логику, например: GetAccreditedUniversitiesUseCase.

3. presentation/
   •	pages/ — UI-экраны (AccreditationPage, NewsPage и т.п.).
   •	widgets/ — компоненты UI, переиспользуемые в рамках фичи.
   •	bloc/ (или provider, cubit) — логика состояния.# enic-kz
