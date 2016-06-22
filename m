From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the kspp tree
Date: Wed, 22 Jun 2016 15:14:42 +1000
Message-ID: <20160622151442.5684f922@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Emese Revfy <re.emese@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Kees,

After merging the kspp tree, today's linux-next build (i386 defconfig)
produced these warning:

x86_64-linux-gcc: warning: '-mcpu=' is deprecated; use '-mtune=' or '-march=' instead

(over 2000 of these)

Introduced (maybe) by commit

  e2135c84d5d2 ("kbuild: no gcc-plugins during cc-option tests")

-- 
Cheers,
Stephen Rothwell
