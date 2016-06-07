From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: merge conflict between kvms390/next and
 s390/features
Date: Wed, 8 Jun 2016 09:27:00 +1000
Message-ID: <20160608092700.79acdec1@canb.auug.org.au>
References: <201606071309.u57D4PtK035410@mx0a-001b2d01.pphosted.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49137 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752435AbcFGX1E (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jun 2016 19:27:04 -0400
In-Reply-To: <201606071309.u57D4PtK035410@mx0a-001b2d01.pphosted.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: linux-next@vger.kernel.org

Hi Martin,

On Tue, 7 Jun 2016 15:07:55 +0200 Martin Schwidefsky <schwidefsky@de.ibm.com> wrote:
>
> we got a report of a compile error due to a clash between the features branch
> and the kvm branch for s390. Fixed with the following patch:
> --
> From 39e60f02654946c40a3d2b78239316c431588145 Mon Sep 17 00:00:00 2001
> From: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Date: Tue, 7 Jun 2016 14:49:43 +0200
> Subject: [PATCH] s390: fix merge conflict in arch/s390/kvm/kvm-s390.c

Thanks for the resolution, I will apply this when I merge the kvms390
tree today.  Someone needs to remember to tell Linus when these two
trees meet in his tree.

-- 
Cheers,
Stephen Rothwell
