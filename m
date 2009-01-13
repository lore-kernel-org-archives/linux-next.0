From: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for January 12 (cifs vs. staging)
Date: Mon, 12 Jan 2009 20:27:49 -0600
Message-ID: <1231813669.6868.3.camel@norville.austin.ibm.com>
References: <20090112154539.4857f533.sfr@canb.auug.org.au>
	 <496B899E.7060605@oracle.com>
	 <524f69650901121058g73c8022eif1d1bcca5c0e01fa@mail.gmail.com>
	 <20090112191330.GC7111@suse.de>
	 <524f69650901121307v67047946yed2c56efaaa839a1@mail.gmail.com>
	 <37759.1231812066@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:40953 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753984AbZAMC1y (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Jan 2009 21:27:54 -0500
In-Reply-To: <37759.1231812066@turing-police.cc.vt.edu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Valdis.Kletnieks@vt.edu
Cc: Steve French <smfrench@gmail.com>, Greg KH <gregkh@suse.de>, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfrench@samba.org

On Mon, 2009-01-12 at 21:01 -0500, Valdis.Kletnieks@vt.edu wrote:
> On Mon, 12 Jan 2009 15:07:48 CST, Steve French said:
> 
> > I have changed the names of cifs's md5 functions in the cifs-2.6.git tree
> > 
> > diff --git a/fs/cifs/md5.h b/fs/cifs/md5.h
> > index f7d4f41..6fba8cb 100644
> 
> I presume there will be another git commit immediately following to fix
> up the call sites?

The git tree has the entire fix.  Steve's post just contained a piece of
it.

Shaggy
-- 
David Kleikamp
IBM Linux Technology Center
