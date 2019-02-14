From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 14 (fanotify)
Date: Thu, 14 Feb 2019 07:58:33 -0800
Message-ID: <b005f0f9-6db1-e9dc-a04c-bf37b37be8ce@infradead.org>
References: <20190214175138.3f69ec91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214175138.3f69ec91@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>
List-Id: linux-next.vger.kernel.org

On 2/13/19 10:51 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190213:
> 

seen on i386:

when # CONFIG_EXPORTFS_BLOCK_OPS is not set:

ld: fs/notify/fanotify/fanotify.o: in function `fanotify_alloc_event':
fanotify.c:(.text+0x25a): undefined reference to `exportfs_encode_inode_fh'
ld: fanotify.c:(.text+0x29e): undefined reference to `exportfs_encode_inode_fh'




-- 
~Randy
