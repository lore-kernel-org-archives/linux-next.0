From: Dave Chinner <david@fromorbit.com>
Subject: Re: Linux-next parallel cp workload hang
Date: Thu, 19 May 2016 09:02:31 +1000
Message-ID: <20160518230231.GA26977@dastard>
References: <20160518014615.GA5302@ZX.nay.redhat.com>
 <20160518055634.GW26977@dastard>
 <20160518083150.GB6551@dhcp12-144.nay.redhat.com>
 <20160518095409.GX26977@dastard>
 <20160518114617.GC6551@dhcp12-144.nay.redhat.com>
 <20160518141726.GY26977@dastard>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160518141726.GY26977@dastard>
Sender: linux-fsdevel-owner@vger.kernel.org
To: Xiong Zhou <xzhou@redhat.com>
Cc: linux-next@vger.kernel.org, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, May 19, 2016 at 12:17:26AM +1000, Dave Chinner wrote:
> Patch below should fix the deadlock.

The test has been running for several hours without failure using
this patch, so I'd say this fixes the problem...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
