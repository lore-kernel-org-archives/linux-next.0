From: "Serge E. Hallyn" <serue@us.ibm.com>
Subject: Re: userns tree ready
Date: Tue, 25 Nov 2008 08:24:06 -0600
Message-ID: <20081125142406.GA9761@us.ibm.com>
References: <20081125001651.GA10661@us.ibm.com> <alpine.LRH.1.10.0811251204450.18891@tundra.namei.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e38.co.us.ibm.com ([32.97.110.159]:51227 "EHLO
	e38.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750894AbYKYOYK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2008 09:24:10 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com [9.17.195.106])
	by e38.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id mAPENA0Z015119
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 07:23:10 -0700
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mAPEO8Lw128684
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 07:24:08 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mAPEO75Y032060
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 07:24:08 -0700
Content-Disposition: inline
In-Reply-To: <alpine.LRH.1.10.0811251204450.18891@tundra.namei.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org

Quoting James Morris (jmorris@namei.org):
> On Mon, 24 Nov 2008, Serge E. Hallyn wrote:
> 
> > Hi Stephen,
> > 
> > I've created a new userns tree - although the patches are completely
> > unchanged from before they were pulled along with David's patches.
> > They apply fine either right after James' security-next tree or at
> > the end of linux-next.  The tree is at
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/sergeh/userns-2.6#next
> > 
> > like before, and is based on James's security-next tree.
> 
> I can merge this into my tree, although if it breaks, I'll need help from 
> you to fix it.

Thanks, James.  I don't know which (security-next or linux-next) is more
appropriate, but I think Stephen may have already added it to
Next/Trees.  I'll of course fix any breakages in any case.

thanks,
-serge
