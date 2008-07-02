From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 2 Jul 2008 20:54:10 +0100
Message-ID: <20080702205410.22d0a9d3@lxorguk.ukuu.org.uk>
References: <20080702153011.c9cc0c4a.sfr@canb.auug.org.au>
	<20080702111006.5b820108.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:58326 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752801AbYGBUL5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Jul 2008 16:11:57 -0400
In-Reply-To: <20080702111006.5b820108.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wed, 2 Jul 2008 11:10:06 -0700
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> On Wed, 2 Jul 2008 15:30:11 +1000 Stephen Rothwell wrote:
> 
> > Hi Alan,
> > 
> > Today's linux-next build (sparc defconfig) failed like this:

Scratch head.. will sort that tomorrow/friday. Really we ought to just
delete stallion/istallion, they've been BROKEN_ON_SMP for years and
nobody ships them enabled
