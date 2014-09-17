From: Robert Baldyga <r.baldyga@samsung.com>
Subject: Re: linux-next: manual merge of the usb-gadget tree with the vfs tree
Date: Wed, 17 Sep 2014 08:54:16 +0200
Message-ID: <54193018.50808@samsung.com>
References: <20140917161658.2e4eb3f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:35707 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395AbaIQGyU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Sep 2014 02:54:20 -0400
In-reply-to: <20140917161658.2e4eb3f1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Felipe Balbi <balbi@ti.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/17/2014 08:16 AM, Stephen Rothwell wrote:
> Hi Felipe,
> 
> Today's linux-next merge of the usb-gadget tree got a conflict in
> drivers/usb/gadget/function/f_fs.c between commit 8322215aa91c ("f_fs:
> saner API for ffs_sb_create_file()") from the vfs tree and commit
> 1b0bf88fd8b8 ("usb: gadget: f_fs: virtual endpoint address mapping")
> from the usb-gadget tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 

Looks good for me.

Thanks
Robert Baldyga
