From: Jakub Kicinski <jakub.kicinski@netronome.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Thu, 2 Aug 2018 19:34:20 -0700
Message-ID: <20180802193420.340a84fe@cakuba.netronome.com>
References: <20180803121430.25899c83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180803121430.25899c83@canb.auug.org.au>
Sender: netdev-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 3 Aug 2018 12:14:30 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (perf) failed
> like this:
> 
> In file included from btf.c:10:0:
> btf.h:25:24: error: redundant redeclaration of 'btf__type_by_id' [-Werror=redundant-decls]
>  const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 type_id);
>                         ^~~~~~~~~~~~~~~
> btf.h:20:24: note: previous declaration of 'btf__type_by_id' was here
>  const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 id);
>                         ^~~~~~~~~~~~~~~
> btf.c:405:24: error: redefinition of 'btf__type_by_id'
>  const struct btf_type *btf__type_by_id(const struct btf *btf,
>                         ^~~~~~~~~~~~~~~
> btf.c:197:24: note: previous definition of 'btf__type_by_id' was here
>  const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 type_id)
>                         ^~~~~~~~~~~~~~~
> btf.c:40:20: error: 'btf_name_by_offset' defined but not used [-Werror=unused-function]
>  static const char *btf_name_by_offset(const struct btf *btf, __u32 offset)
>                     ^~~~~~~~~~~~~~~~~~
> mv: cannot stat 'perf/.libbpf.o.tmp': No such file or directory
> tools/build/Makefile.build:96: recipe for target 'perf/libbpf.o' failed
> In file included from libbpf.c:52:0:
> btf.h:25:24: error: redundant redeclaration of 'btf__type_by_id' [-Werror=redundant-decls]
>  const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 type_id);
>                         ^~~~~~~~~~~~~~~
> btf.h:20:24: note: previous declaration of 'btf__type_by_id' was here
>  const struct btf_type *btf__type_by_id(const struct btf *btf, __u32 id);
>                         ^~~~~~~~~~~~~~~
> mv: cannot stat 'perf/.libbpf.o.tmp': No such file or directory
> tools/build/Makefile.build:96: recipe for target 'perf/libbpf.o' failed
> 
> Caused by commit
> 
>   89b1698c93a9 ("Merge ra.kernel.org:/pub/scm/linux/kernel/git/davem/net")
> 
> Some of the lines in tools/lib/bpf/btf.[ch] were duplicated (they existed
> on both sides of the merge).
> 
> I have used the net-next tree from next-20180802 for today.

I just noticed that too, fix out:

http://patchwork.ozlabs.org/patch/953018/
