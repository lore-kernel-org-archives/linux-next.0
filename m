From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the netfilter-next tree
Date: Mon, 20 Mar 2017 11:12:36 +1100
Message-ID: <20170320111236.77c5a05a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
Sender: netfilter-devel-owner@vger.kernel.org
To: Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Elena Reshetova <elena.reshetova@intel.com>, Hans Liljestrand <ishkamiel@gmail.com>, Kees Cook <keescook@chromium.org>, David Windsor <dwindsor@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the netfilter-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

net/netfilter/nfnetlink_acct.c: In function 'nfnl_acct_try_del':
net/netfilter/nfnetlink_acct.c:329:15: warning: unused variable 'refcount' [-Wunused-variable]
  unsigned int refcount;
               ^

Introduced by commit

  b54ab92b84b6 ("netfilter: refcounter conversions")

-- 
Cheers,
Stephen Rothwell
