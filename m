From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the imx-mxs tree
Date: Tue,  8 Oct 2013 15:44:12 +0200
Message-ID: <1381239855-16314-2-git-send-email-treding@nvidia.com>
References: <1381239855-16314-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381239855-16314-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Olof Johansson <olof@lixom.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the imx-mxs tree got conflicts in

	arch/arm/mach-imx/mach-imx6q.c

caused by commits 4d9d18a (ARM: imx: remove custom .init_time hook),
e709f38 (ARM: imx6: report soc info via soc device) and 3087d32 (ARM:
imx6q: use common soc revision helpers).

I fixed it up (see below). Please verify that the resolution looks
correct.

Thanks,
Thierry
---
diff --cc arch/arm/mach-imx/mach-imx6q.c
index 3be0fa0,398858b..049e36e
--- a/arch/arm/mach-imx/mach-imx6q.c
+++ b/arch/arm/mach-imx/mach-imx6q.c
@@@ -190,8 -164,11 +162,14 @@@ static void __init imx6q_1588_init(void
  
  static void __init imx6q_init_machine(void)
  {
+ 	struct device *parent;
+ 
 +	imx_print_silicon_rev(cpu_is_imx6dl() ? "i.MX6DL" : "i.MX6Q",
- 			      imx6q_revision());
++			      imx_get_soc_revision());
++
+ 	parent = imx_soc_device_init();
+ 	if (parent == NULL)
+ 		pr_warn("failed to initialize soc device\n");
  
  	imx6q_enet_phy_init();
  
