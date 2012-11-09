From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build warning after merge of the akpm tree
Date: Fri, 9 Nov 2012 10:00:34 +0000
Message-ID: <CACxGe6uLfdYohqFQLGV3MqJxNZK7uKKvg6JuP8UBG2HfaXq6XQ@mail.gmail.com>
References: <20121109144307.a2a77fcdab8aaa262bf54cd9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121109144307.a2a77fcdab8aaa262bf54cd9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Fri, Nov 9, 2012 at 3:43 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andrew,
>
> After merging the akpm tree, today's linux-next build (powerpc
> allnoconfig - among others) produced this warning:
>
> drivers/of/fdt.c: In function 'of_scan_flat_dt':
> drivers/of/fdt.c:490:10: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
>
> Introduced by commit "drivers/of/fdt.c: re-use kernel's kbasename()".

Adding this hunk to the patch fixes it:

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 91a375f..738228f 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -459,7 +459,7 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,

        do {
                u32 tag = be32_to_cpup((__be32 *)p);
-               char *pathp;
+               const char *pathp;

                p += 4;
                if (tag == OF_DT_END_NODE) {

g.
