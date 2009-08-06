From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: agp tree build failure
Date: Thu, 06 Aug 2009 10:39:02 +0100
Message-ID: <1249551542.568.4.camel@macbook.infradead.org>
References: <20090806191054.74c475e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754607AbZHFJtq@vger.kernel.org>
In-Reply-To: <20090806191054.74c475e5.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 2009-08-06 at 02:10 -0700, Stephen Rothwell wrote:
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/char/agp/uninorth-agp.c: In function 'uninorth_configure':
> drivers/char/agp/uninorth-agp.c:138: error: 'struct agp_bridge_data' has no member named 'scratch_page_real'
> 
> Caused by commit c2980d8c2961113f24863f70d8ad016f55224c81 ("agp: Switch
> agp_{un,}map_page() to take struct page * argument").
> 
> I have reverted that commit for today (and
> 6a12235c7d2d75c7d94b9afcaaecd422ff845ce0 ("agp: kill phys_to_gart() and
> gart_to_phys()") which depends on it).

Oops, sorry -- I thought I'd dealt with that.

diff --git a/drivers/char/agp/uninorth-agp.c b/drivers/char/agp/uninorth-agp.c
index 2e99311..4317a55 100644
--- a/drivers/char/agp/uninorth-agp.c
+++ b/drivers/char/agp/uninorth-agp.c
@@ -135,7 +135,7 @@ static int uninorth_configure(void)
 	if (is_u3) {
 		pci_write_config_dword(agp_bridge->dev,
 				       UNI_N_CFG_GART_DUMMY_PAGE,
-				       agp_bridge->scratch_page_real >> 12);
+				       page_to_phys(agp_bridge->scratch_page_page) >> 12);
 	}
 
 	return 0;

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
