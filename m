From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: Tree for Feb 14 (fanotify)
Date: Thu, 14 Feb 2019 17:49:37 +0100
Message-ID: <20190214164937.GC23000@quack2.suse.cz>
References: <20190214175138.3f69ec91@canb.auug.org.au>
 <b005f0f9-6db1-e9dc-a04c-bf37b37be8ce@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b005f0f9-6db1-e9dc-a04c-bf37b37be8ce@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>
List-Id: linux-next.vger.kernel.org

On Thu 14-02-19 07:58:33, Randy Dunlap wrote:
> On 2/13/19 10:51 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20190213:
> > 
> 
> seen on i386:
> 
> when # CONFIG_EXPORTFS_BLOCK_OPS is not set:
> 
> ld: fs/notify/fanotify/fanotify.o: in function `fanotify_alloc_event':
> fanotify.c:(.text+0x25a): undefined reference to `exportfs_encode_inode_fh'
> ld: fanotify.c:(.text+0x29e): undefined reference to `exportfs_encode_inode_fh'

Yeah, fanotify needs to select EXPORTFS now. Added patch to my tree. Thanks
for report!

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
