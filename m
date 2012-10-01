From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: manual merge of the workqueues tree with the hid
 tree
Date: Tue, 2 Oct 2012 00:23:47 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1210020021570.23544@pobox.suse.cz>
References: <20120821135832.4788b9d64fea34502cca895a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120821135832.4788b9d64fea34502cca895a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, =?ISO-8859-15?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>
List-Id: linux-next.vger.kernel.org

On Tue, 21 Aug 2012, Stephen Rothwell wrote:

> Hi Tejun,
> 
> Today's linux-next merge of the workqueues tree got a conflict in
> drivers/hid/hid-picolcd.c between commit fabdbf2fd22f ("HID: picoLCD:
> split driver code") from the hid tree and commit 43829731dd37
> ("workqueue: deprecate flush[_delayed]_work_sync()") from the workqueues
> tree.
> 
> The former commit moved the code changed by the latter into a new file
> (and removed the old file) and then a later commit removed the call to
> flush_work_sync().  I just removed the file.

The same here. My part is now in Linus' tree -- Tejun, could you please 
sort this out on your side?

Thanks a lot,

-- 
Jiri Kosina
SUSE Labs
