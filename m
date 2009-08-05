From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: Next July 29 : Hugetlb test failure (OOPS free_hugepte_range)
Date: Wed, 05 Aug 2009 21:03:44 +0530
Message-ID: <4A79A658.8000105@in.ibm.com>
References: <20090729173611.b82478cd.sfr@canb.auug.org.au> <4A706504.6040704@in.ibm.com> <E0A64FA0-C835-4361-A203-E9CB5377599C@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp03.in.ibm.com ([59.145.155.3]:60595 "EHLO
	e28smtp03.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755776AbZHEPdr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2009 11:33:47 -0400
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by e28smtp03.in.ibm.com (8.14.3/8.13.1) with ESMTP id n75FXkjV020064
	for <linux-next@vger.kernel.org>; Wed, 5 Aug 2009 21:03:46 +0530
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id n75FXkaY1519686
	for <linux-next@vger.kernel.org>; Wed, 5 Aug 2009 21:03:46 +0530
Received: from d28av04.in.ibm.com (loopback [127.0.0.1])
	by d28av04.in.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id n75FXj7b013270
	for <linux-next@vger.kernel.org>; Thu, 6 Aug 2009 01:33:46 +1000
In-Reply-To: <E0A64FA0-C835-4361-A203-E9CB5377599C@kernel.crashing.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kumar Gala <galak@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org

Kumar Gala wrote:
>
> On Jul 29, 2009, at 10:04 AM, Sachin Sant wrote:
>
>> While executing hugetlb tests against today's Next tree on
>> a Power 6 box came across following OOPS.
>
> out of interest what tests are you running for hugetlb?
The one maintained at : http://libhugetlbfs.ozlabs.org/ which points
to the sourceforge libhugetlbfs project.

Latest release can be downloaded from sourceforge using
http://sourceforge.net/projects/libhugetlbfs/files/

I am using version 2.5

Thanks
-Sachin



-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
