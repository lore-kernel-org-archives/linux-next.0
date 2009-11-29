From: Boaz Harrosh <bharrosh@panasas.com>
Subject: Re: linux-next: manual merge of the osd tree with the scsi tree
Date: Sun, 29 Nov 2009 11:10:26 +0200
Message-ID: <4B123A82.10104@panasas.com>
References: <20091127143229.108298c6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754226AbZK2JKd@vger.kernel.org>
In-Reply-To: <20091127143229.108298c6.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>
List-Id: linux-next.vger.kernel.org

On 11/27/2009 05:32 AM, Stephen Rothwell wrote:
> Hi Boaz,
> 
> Today's linux-next merge of the osd tree got a conflict in
> drivers/scsi/osd/osd_uld.c between commit
> f89b9ee4a722721ed205b8c29555ac75fbe8c2cc ("[SCSI] osduld: Use
> device->release instead of internal kref") from the scsi tree and commit
> 9b579fe8588b861dcf0c9b620757729643db4557 ("osduld: Use device->release
> instead of internal kref") from the osd tree.
> 
> These are slightly different versions of the same patch ...
> 
> And commit 01e4c32c668251e74eb179ee1207c075466c4ef8 ("osduld: No need to
> use dev_set_drvdata on embedded devices") from the osd also contributes
> to the conflict.
> 

James has squashed these two patches together. Which do belong together
I should say. In my tree they are separate. I will change my tree to
match James's.

Thanks James, I prefer it much better this way.

> I fixed it up (the obvious way) and can carry the fix for a while.

Thanks
Boaz
