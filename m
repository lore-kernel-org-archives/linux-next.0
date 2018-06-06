From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the y2038 tree
Date: Wed, 6 Jun 2018 15:47:25 +0200
Message-ID: <CAK8P3a3YmgpSNC3m8vW=tkMXxVVVR+riuw4=snwhYYW-rP_htg@mail.gmail.com>
References: <20180606204116.5b01ed36@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180606204116.5b01ed36@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Deepa Dinamani <deepa.kernel@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jun 6, 2018 at 12:41 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the y2038 tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> fs/pstore/ram.c: In function 'ramoops_read_kmsg_hdr':
> fs/pstore/ram.c:39:29: warning: format '%ld' expects argument of type 'long int *', but argument 3 has type 'time64_t * {aka long long int *}' [-Wformat=]
>  #define RAMOOPS_KERNMSG_HDR "===="
>                              ^
> fs/pstore/ram.c:167:21: note: in expansion of macro 'RAMOOPS_KERNMSG_HDR'
>   if (sscanf(buffer, RAMOOPS_KERNMSG_HDR TVSEC_FMT ".%lu-%c\n%n",
>                      ^~~~~~~~~~~~~~~~~~~
> fs/pstore/ram.c:42:23: note: format string is defined here
>  # define TVSEC_FMT "%ld"
>                      ~~^
>                      %lld
> fs/pstore/ram.c:39:29: warning: format '%ld' expects argument of type 'long int *', but argument 3 has type 'time64_t * {aka long long int *}' [-Wformat=]
>  #define RAMOOPS_KERNMSG_HDR "===="
>                              ^
> fs/pstore/ram.c:174:28: note: in expansion of macro 'RAMOOPS_KERNMSG_HDR'
>   } else if (sscanf(buffer, RAMOOPS_KERNMSG_HDR TVSEC_FMT ".%lu\n%n",
>                             ^~~~~~~~~~~~~~~~~~~
> fs/pstore/ram.c:42:23: note: format string is defined here
>  # define TVSEC_FMT "%ld"
>                      ~~^
>                      %lld
> fs/pstore/ram.c: In function 'ramoops_write_kmsg_hdr':
> fs/pstore/ram.c:39:29: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'time64_t {aka long long int}' [-Wformat=]
>  #define RAMOOPS_KERNMSG_HDR "===="
>                              ^
> fs/pstore/ram.c:370:30: note: in expansion of macro 'RAMOOPS_KERNMSG_HDR'
>   hdr = kasprintf(GFP_ATOMIC, RAMOOPS_KERNMSG_HDR TVSEC_FMT ".%lu-%c\n",
>                               ^~~~~~~~~~~~~~~~~~~
> fs/pstore/ram.c:42:23: note: format string is defined here
>  # define TVSEC_FMT "%ld"
>                      ~~^
>                      %lld
>
> Introduced by commit
>
>   0f0d83b99ef7 ("pstore: Convert internal records to timespec64")
>

Thanks for the report, I had actually provided a fix for this earlier
(it was a clash
between a patch in Deepa's tree with one of mine that Thomas had picked up
into tip) but forgot to apply it before I pushed out the merged tree.

I've updated my tree now.

      Arnd
