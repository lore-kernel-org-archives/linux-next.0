From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 29 (kconfig)
Date: Mon, 29 Apr 2013 09:25:54 -0700
Message-ID: <517E9F12.1020309@infradead.org>
References: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <20130429191754.8ee71fb814790bf345516ab8@canb.auug.org.au>
Sender: linux-kbuild-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 04/29/13 02:17, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130426:
> 


> make ARCH=x86_64 O=X64 xconfig &
  GEN     /local/lnx/next/linux-next-20130429/X64/Makefile
  HOSTCXX scripts/kconfig/qconf.o
In file included from scripts/kconfig/expr.h:15:0,
                 from scripts/kconfig/lkc.h:9,
                 from scripts/kconfig/qconf.cc:46:
scripts/kconfig/list.h: In function 'void list_del(list_head*)':
scripts/kconfig/list.h:128:16: error: invalid conversion from 'void*' to 'list_head*' [-fpermissive]
scripts/kconfig/list.h:129:16: error: invalid conversion from 'void*' to 'list_head*' [-fpermissive]
make[2]: *** [scripts/kconfig/qconf.o] Error 1



-- 
~Randy
