{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE StandaloneDeriving          #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.Support.DescribeAttachment
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Returns the attachment that has the specified ID. Attachment IDs are
-- generated by the case management system when you add an attachment to a
-- case or case communication. Attachment IDs are returned in the
-- AttachmentDetails objects that are returned by the DescribeCommunications
-- operation.
module Network.AWS.Support.DescribeAttachment
    (
    -- * Request
      DescribeAttachment
    -- ** Request constructor
    , describeAttachment
    -- ** Request lenses
    , daAttachmentId

    -- * Response
    , DescribeAttachmentResponse
    -- ** Response constructor
    , describeAttachmentResponse
    -- ** Response lenses
    , darAttachment
    ) where

import Network.AWS.Support.Types
import Network.AWS.Prelude
import Network.AWS.Request.JSON

newtype DescribeAttachment = DescribeAttachment
    { _daAttachmentId :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeAttachment' request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @AttachmentId ::@ @Text@
--
describeAttachment :: Text -- ^ 'daAttachmentId'
                   -> DescribeAttachment
describeAttachment p1 = DescribeAttachment
    { _daAttachmentId = p1
    }

-- | The ID of the attachment to return. Attachment IDs are returned by the
-- DescribeCommunications operation.
daAttachmentId :: Lens' DescribeAttachment Text
daAttachmentId = lens _daAttachmentId (\s a -> s { _daAttachmentId = a })

instance ToPath DescribeAttachment

instance ToQuery DescribeAttachment

instance ToHeaders DescribeAttachment

instance ToJSON DescribeAttachment

-- | The content and file name of the attachment returned by the
-- DescribeAttachment operation.
newtype DescribeAttachmentResponse = DescribeAttachmentResponse
    { _darAttachment :: Maybe Attachment
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeAttachmentResponse' response.
--
-- This constructor is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @Attachment ::@ @Maybe Attachment@
--
describeAttachmentResponse :: DescribeAttachmentResponse
describeAttachmentResponse = DescribeAttachmentResponse
    { _darAttachment = Nothing
    }

-- | The attachment content and file name.
darAttachment :: Lens' DescribeAttachmentResponse (Maybe Attachment)
darAttachment = lens _darAttachment (\s a -> s { _darAttachment = a })

instance FromJSON DescribeAttachmentResponse

instance AWSRequest DescribeAttachment where
    type Sv DescribeAttachment = Support
    type Rs DescribeAttachment = DescribeAttachmentResponse

    request = get
    response _ = jsonResponse
