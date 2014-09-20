{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE StandaloneDeriving          #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.IAM.DeleteAccessKey
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes the access key associated with the specified user. If you do not
-- specify a user name, IAM determines the user name implicitly based on the
-- AWS access key ID signing the request. Because this action works for access
-- keys under the AWS account, you can use this API to manage root credentials
-- even if the AWS account has no associated users. https://iam.amazonaws.com/
-- ?Action=DeleteAccessKey &UserName=Bob &AccessKeyId=AKIAIOSFODNN7EXAMPLE
-- &Version=2010-05-08 &AUTHPARAMS 7a62c49f-347e-4fc4-9331-6e8eEXAMPLE.
module Network.AWS.IAM.DeleteAccessKey
    (
    -- * Request
      DeleteAccessKey
    -- ** Request constructor
    , deleteAccessKey
    -- ** Request lenses
    , dakUserName
    , dakAccessKeyId

    -- * Response
    , DeleteAccessKeyResponse
    -- ** Response constructor
    , deleteAccessKeyResponse
    ) where

import Network.AWS.Request.Query
import Network.AWS.IAM.Types
import Network.AWS.Prelude

data DeleteAccessKey = DeleteAccessKey
    { _dakUserName :: Maybe Text
    , _dakAccessKeyId :: Text
    } deriving (Eq, Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteAccessKey' request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @UserName ::@ @Maybe Text@
--
-- * @AccessKeyId ::@ @Text@
--
deleteAccessKey :: Text -- ^ 'dakAccessKeyId'
                -> DeleteAccessKey
deleteAccessKey p2 = DeleteAccessKey
    { _dakUserName = Nothing
    , _dakAccessKeyId = p2
    }

-- | Name of the user whose key you want to delete.
dakUserName :: Lens' DeleteAccessKey (Maybe Text)
dakUserName = lens _dakUserName (\s a -> s { _dakUserName = a })

-- | The access key ID for the access key ID and secret access key you want to
-- delete.
dakAccessKeyId :: Lens' DeleteAccessKey Text
dakAccessKeyId = lens _dakAccessKeyId (\s a -> s { _dakAccessKeyId = a })

instance ToQuery DeleteAccessKey where
    toQuery = genericQuery def

data DeleteAccessKeyResponse = DeleteAccessKeyResponse
    deriving (Eq, Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DeleteAccessKeyResponse' response.
--
-- This constructor is provided for convenience and testing purposes.
deleteAccessKeyResponse :: DeleteAccessKeyResponse
deleteAccessKeyResponse = DeleteAccessKeyResponse

instance AWSRequest DeleteAccessKey where
    type Sv DeleteAccessKey = IAM
    type Rs DeleteAccessKey = DeleteAccessKeyResponse

    request = post "DeleteAccessKey"
    response _ = nullaryResponse DeleteAccessKeyResponse
