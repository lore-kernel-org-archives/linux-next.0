From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: manual merge of the ide tree with the driver-core tree
Date: Tue, 27 Jan 2009 15:43:10 +0100
Message-ID: <200901271543.10368.bzolnier@gmail.com>
References: <20090126125011.e060bd19.sfr@canb.auug.org.au> <20090126031821.GA1911@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.184]:29507 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752803AbZA0PZK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Jan 2009 10:25:10 -0500
Received: by nf-out-0910.google.com with SMTP id d3so1179062nfc.21
        for <linux-next@vger.kernel.org>; Tue, 27 Jan 2009 07:25:07 -0800 (PST)
In-Reply-To: <20090126031821.GA1911@kroah.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Monday 26 January 2009, Greg KH wrote:
> On Mon, Jan 26, 2009 at 12:50:11PM +1100, Stephen Rothwell wrote:
> > Hi Bartlomiej,
> > 
> > Today's linux-next merge of the ide tree got a conflict in
> > drivers/ide/ide-acpi.c between commit
> > ea23519ff92f553facc0a73fe4daab852c75a306 ("ide: struct device - replace
> > bus_id with dev_name(), dev_set_name()") from the driver-core tree and
> > commit d721aa90f7ba2059b007a9c13c9fb09db99ce467 ("ide-acpi: cleanup
> > do_drive_get_GTF()") from the ide tree.
> > 
> > The latter removed code that the former modified.  I used the latter
> > version.
> 
> Bart, you have the patch that Kay sent, is it not needed anymore?

Yeah, I just got it (if you meant fixup for IDE ACPI debug code, cause the
original patch is already in Linus' tree).  You can drop it from your tree.

Thanks,
Bart
