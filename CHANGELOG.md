# SDK Changelog

## 1.0.3 (2015-09-30)

### Added

- Images key were added to user and event models
- Friends and Follower counts were added to user model
- Keys to determine weather another user is a friend, follower or followed were added to the user model
- Creating connections with an event (is now following) was added
- Tests for the data models were added

### Changed

- API Base URL was updated from 0.2 to 0.3
- `/user/` routes were changed to `/me/` for the currentUser
- Parameters from old routs were deleted
- Small bug fixed were made

## 1.0.2 (2015-07-28)

### Changed

- Further improvements to IDs have been made
- Smal bug fixed were made

## 1.0.1 (2015-07-20)

### Changed

- IDs from the API were changed from string to integer
- CurrentUserEvents route was fixed
- Small typos were fixed

## 1.0.0 (2015-06-18)

First release of the iOS SDK including:

- Network Communication Layer
- Data model implementation
- Parsing in native objects
- A flush for queueing the events
- Offline behaviour for events
- Persistent cache for users and feeds when offline
- Error handling and custom error classes