module Types exposing (Day, Entry(..), EntryType(..), EntryUpdate(..), EntryUpdateResponse(..), HoursDay(..), HoursMonth(..), HoursResponse(..), Identifier, LatestEntry(..), Login, Month, NDTd, NDTh, Project(..), ReportableTask(..), User(..))

import Dict exposing (Dict)


type alias Identifier =
    Int


type alias NDTh =
    Float


type alias NDTd =
    Float


type alias Day =
    String


type alias Month =
    String


type alias Login =
    String


type Project
    = Project
        { id : Identifier
        , name : String
        , tasks : List ReportableTask
        , closed : Bool
        }


type ReportableTask
    = ReportableTask
        { id : Identifier
        , name : String
        , closed : Bool
        , latestEntry : LatestEntry
        , hoursRemaining : NDTh
        }


type LatestEntry
    = LatestEntry
        { description : String
        , date : Day
        , hours : NDTh
        }


type User
    = User
        { firstName : String
        , lastName : String
        , balance : NDTh
        , holidaysLeft : NDTd
        , utilizationRate : Float
        , profilePicture : String
        }


type HoursResponse
    = HoursResponse
        { defaultWorkHours : NDTh
        , reportableProjects : List Project
        , markedProjects : List Project
        , months : Dict Month HoursMonth
        }


type HoursMonth
    = HoursMonth
        { hours : NDTh
        , capacity : NDTh
        , utilizationRate : Float
        , days : Dict Day HoursDay
        }


type HoursDay
    = HoursDay
        { type_ : String
        , hours : NDTh
        , entries : List Entry
        , closed : Bool
        }


type Entry
    = Entry
        { id : Identifier
        , projectId : Identifier
        , taskId : Identifier
        , day : Day
        , description : String
        , closed : Bool
        , hours : NDTh
        , billably : EntryType
        }


type EntryType
    = Billable
    | NonBillable
    | Absence


type EntryUpdateResponse
    = EntryUpdateResponse
        { user : User
        , hours : HoursResponse
        }


type EntryUpdate
    = EntryUpdate
        { taskId : Identifier
        , projectId : Identifier
        , description : String
        , date : Day
        , hours : NDTh
        , closed : Bool
        }