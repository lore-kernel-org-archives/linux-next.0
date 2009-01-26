From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the ide tree with the driver-core
	tree
Date: Sun, 25 Jan 2009 19:18:21 -0800
Message-ID: <20090126031821.GA1911@kroah.com>
References: <20090126125011.e060bd19.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:36379 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751241AbZAZDUH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 25 Jan 2009 22:20:07 -0500
Content-Disposition: inline
In-Reply-To: <20090126125011.e060bd19.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

On Mon, Jan 26, 2009 at 12:50:11PM +1100, Stephen Rothwell wrote:
> Hi Bartlomiej,
> 
> Today's linux-next merge of the ide tree got a conflict in
> drivers/ide/ide-acpi.c between commit
> ea23519ff92f553facc0a73fe4daab852c75a306 ("ide: struct device - replace
> bus_id with dev_name(), dev_set_name()") from the driver-core tree and
> commit d721aa90f7ba2059b007a9c13c9fb09db99ce467 ("ide-acpi: cleanup
> do_drive_get_GTF()") from the ide tree.
> 
> The latter removed code that the former modified.  I used the latter
> version.

Bart, you have the patch that Kay sent, is it not needed anymore?

Stephen, thanks for putting up with this, it's hard to get rid of driver
core fields at times :(

thanks,

greg k-h
