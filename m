From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 4 (fs/afs/)
Date: Mon, 4 Jun 2018 09:12:35 -0700
Message-ID: <7e4a317a-d57e-1499-dc1e-2eba35610632@infradead.org>
References: <20180604215911.75399f6e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180604215911.75399f6e@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org, Linux FS Devel <linux-fsdevel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 06/04/2018 04:59 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180601:
> 

on x86_64:

# CONFIG_PROC_FS is not set


../fs/afs/proc.c: In function ‘afs_proc_init’:
../fs/afs/proc.c:604:2: error: implicit declaration of function ‘proc_create_net_data_write’ [-Werror=implicit-function-declaration]
  if (!proc_create_net_data_write("cells", 0644, p,
  ^
../fs/afs/proc.c:609:6: error: implicit declaration of function ‘proc_create_net_single_write’ [-Werror=implicit-function-declaration]
      !proc_create_net_single_write("rootcell", 0644, p,
      ^
../fs/afs/proc.c: At top level:
../fs/afs/proc.c:517:12: warning: ‘afs_proc_stats_show’ defined but not used [-Wunused-function]
 static int afs_proc_stats_show(struct seq_file *m, void *v)
            ^
cc1: some warnings being treated as errors
../scripts/Makefile.build:311: recipe for target 'fs/afs/proc.o' failed


afs seems not to handle CONFIG_PROC_FS=n at all.

-- 
~Randy
