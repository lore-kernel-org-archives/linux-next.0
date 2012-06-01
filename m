From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH -next] s390/signal: fix compile error
Date: Fri, 1 Jun 2012 08:34:34 +0100
Message-ID: <20120601073433.GH30000@ZenIV.linux.org.uk>
References: <20120601071704.GA3535@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:35626 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751518Ab2FAHef (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Jun 2012 03:34:35 -0400
Content-Disposition: inline
In-Reply-To: <20120601071704.GA3535@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org

On Fri, Jun 01, 2012 at 09:17:05AM +0200, Heiko Carstens wrote:
> Hi Al,
> 
> could you please add/merge the patch below which fixes a simple compile
> error in linux-next caused by your signal work?

Already there.  I really need to do something about the workflow on
cross-builds - that's not the first time fixes get lost and not
moved from tree on a build box to the devel one ;-/
