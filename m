From: Krzysztof Halasa <khc@pm.waw.pl>
Subject: Re: linux-next: Tree for August 22 (hdlc/wanbook)
Date: Sat, 23 Aug 2008 15:18:34 +0200
Message-ID: <m3od3jhnth.fsf@maximus.localdomain>
References: <20080822173415.6958cbcc.sfr@canb.auug.org.au>
	<20080822152059.c83ea19a.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754221AbYHWNSs@vger.kernel.org>
In-Reply-To: <20080822152059.c83ea19a.randy.dunlap@oracle.com> (Randy Dunlap's message of "Fri\, 22 Aug 2008 15\:20\:59 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Randy,

Randy Dunlap <randy.dunlap@oracle.com> writes:

> wanbook.tmpl was removed!?!  why?
> Is there some replacement for it or is it just not useful?

The latter. wanbook.tmpl was actually syncppp description only, and
syncppp doesn't seem to be surviving.

> I seem to have missed the patch(es) that did this...

http://lkml.org/lkml/2008/8/9/130

> Looks like Documentation/DocBook/Makefile was missed in the patch.

Precisely. Thanks for the info. Fixed now.
-- 
Krzysztof Halasa
