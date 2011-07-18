From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: build warning after merge of the vfs tree
Date: Mon, 18 Jul 2011 06:20:48 +0100
Message-ID: <20110718052048.GZ11013@ZenIV.linux.org.uk>
References: <20110718150456.d0eea458aab56fd1488ccc39@canb.auug.org.au>
 <20110718051736.GY11013@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:57069 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751405Ab1GRFUt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2011 01:20:49 -0400
Content-Disposition: inline
In-Reply-To: <20110718051736.GY11013@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Josef Bacik <josef@redhat.com>

On Mon, Jul 18, 2011 at 06:17:37AM +0100, Al Viro wrote:

> Argh...  There had been several places where ->fsync() change hadn't been
> done in the original patch; I've patched them up, but forgot to change the
> prototype in this one ;-/
> 
> s/file,/& loff_t start, loff_t end,/ in the obvious place; I'll push the
> updated variant in a few.

Fixed and pushed.
