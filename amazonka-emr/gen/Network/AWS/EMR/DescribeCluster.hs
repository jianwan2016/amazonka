{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE StandaloneDeriving          #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EMR.DescribeCluster
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Provides cluster-level details including status, hardware and software
-- configuration, VPC settings, and so on. For information about the cluster
-- steps, see ListSteps.
module Network.AWS.EMR.DescribeCluster
    (
    -- * Request
      DescribeCluster
    -- ** Request constructor
    , describeCluster
    -- ** Request lenses
    , dcClusterId

    -- * Response
    , DescribeClusterResponse
    -- ** Response constructor
    , describeClusterResponse
    -- ** Response lenses
    , dcrCluster
    ) where

import Network.AWS.EMR.Types
import Network.AWS.Prelude
import Network.AWS.Request.JSON

-- | This input determines which cluster to describe.
newtype DescribeCluster = DescribeCluster
    { _dcClusterId :: Text
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeCluster' request.
--
-- The fields accessible through corresponding lenses are:
--
-- * @ClusterId ::@ @Text@
--
describeCluster :: Text -- ^ 'dcClusterId'
                -> DescribeCluster
describeCluster p1 = DescribeCluster
    { _dcClusterId = p1
    }

-- | The identifier of the cluster to describe.
dcClusterId :: Lens' DescribeCluster Text
dcClusterId = lens _dcClusterId (\s a -> s { _dcClusterId = a })

instance ToPath DescribeCluster

instance ToQuery DescribeCluster

instance ToHeaders DescribeCluster

instance ToJSON DescribeCluster

-- | This output contains the description of the cluster.
newtype DescribeClusterResponse = DescribeClusterResponse
    { _dcrCluster :: Maybe Cluster
    } deriving (Show, Generic)

-- | Smart constructor for the minimum required parameters to construct
-- a valid 'DescribeClusterResponse' response.
--
-- This constructor is provided for convenience and testing purposes.
--
-- The fields accessible through corresponding lenses are:
--
-- * @Cluster ::@ @Maybe Cluster@
--
describeClusterResponse :: DescribeClusterResponse
describeClusterResponse = DescribeClusterResponse
    { _dcrCluster = Nothing
    }

-- | This output contains the details for the requested cluster.
dcrCluster :: Lens' DescribeClusterResponse (Maybe Cluster)
dcrCluster = lens _dcrCluster (\s a -> s { _dcrCluster = a })

instance FromJSON DescribeClusterResponse

instance AWSRequest DescribeCluster where
    type Sv DescribeCluster = EMR
    type Rs DescribeCluster = DescribeClusterResponse

    request = get
    response _ = jsonResponse
