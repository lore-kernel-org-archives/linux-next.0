From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Tue, 30 Jun 2009 16:26:05 +0530
Message-ID: <4A49EF45.2030407@in.ibm.com>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com> <20090629103123.GC9321@osiris.boeblingen.de.ibm.com> <20090629103943.GA31299@wotan.suse.de> <4A49A3B4.5070501@in.ibm.com> <20090630083410.GA1114@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp05.au.ibm.com ([202.81.31.147]:48678 "EHLO
	e23smtp05.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751687AbZF3K4R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2009 06:56:17 -0400
In-Reply-To: <20090630083410.GA1114@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

Nick Piggin wrote:
> If you are not seeing any extra messages from the patch, then it
> could be that you are seeing ZERO_SIZE_PTR or similar errors as
> well. I will ask if you can try the patch I sent in the other
> thread.
Still facing same problem after applying the patch you mentioned.
Probably the s390 issue is different that the Power6 issue.

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
