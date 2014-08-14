From: Chris Mason <clm@fb.com>
Subject: Re: linux-next: new stuff in the btrfs tree
Date: Wed, 13 Aug 2014 20:44:05 -0400
Message-ID: <53EC0655.8030600@fb.com>
References: <20140814100750.5c6368f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:23857 "EHLO
	mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752149AbaHNAoM (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2014 20:44:12 -0400
In-Reply-To: <20140814100750.5c6368f1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Josef Bacik <jbacik@fb.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/13/2014 08:07 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Are all the commits just added to the btrfs tree really intended for
> v3.17?  If not then please remove them until after v3.17-rc1 is
> released.  If so, then they are very late :-(
> 
> I suspect the latter because some of them seem to date from June (and a
> few even from February).
> 

Hi Stephen,

Yes, these are for 3.17-rc1.  My push to my -next tree was late due to
vacations and because we've been hunting a deadlock in our workqueue
code, but I've had these in testing for some time.

-chris
