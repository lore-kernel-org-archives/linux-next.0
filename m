From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCHSET linux-next] update gfp/slab.h includes
Date: Tue, 06 Apr 2010 11:30:03 +0900
Message-ID: <4BBA9CAB.4050107@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:45269 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757057Ab0DFCaK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Apr 2010 22:30:10 -0400
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello, Stephen.

On 03/30/2010 02:52 AM, Tejun Heo wrote:
> Mainline is scheduled to be updated not to include slab.h implicitly
> from percpu.h which means that each .c file which uses gfp or slab API
> should include respective header file directly.

You probably have noticed already but both slabh branch and percpu
changes have been merged to mainline, so once these patches are merged
to subsystem trees, there shouldn't be many new breakages showing up
in linux-next.  Thanks a lot for helping testing and fixing up this
huge ugly monster.  Much appreciated.

-- 
tejun
