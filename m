From: Gregory Haskins <ghaskins@novell.com>
Subject: [PATCH] vbus: make dev_attr_modalias static to avoid conflicts with
	Xen
Date: Tue, 24 Nov 2009 07:45:50 -0500
Message-ID: <20091124124550.22031.5752.stgit@dev.haskins.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

Stephen Rothwell wrote:
> Hi Gregory,
> 
> Today's linux-next build (x86_6 _allmodconfig) failed like this:
> 
> drivers/vbus/built-in.o:(.data+0x0): multiple definition of `dev_attr_modalias'
> drivers/xen/built-in.o:(.data+0x46d0): first defined here
> 
> Caused by commit 59aa8f441d27c8470764a513dafa46a77f33e953 ("vbus: add
> autoprobe capability to guest").  The DEVICE_ATTR(modalias ...) should
> probably be static.  I should probably be static in
> drivers/xen/xenbus/xenbus_probe.c as well.
> 
> I have used the version of the alacrity tree from next-20091123 for today.
> 

This patch addresses the issue

Signed-off-by: Gregory Haskins <ghaskins@novell.com>
---

 drivers/vbus/bus-proxy.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/vbus/bus-proxy.c b/drivers/vbus/bus-proxy.c
index 106e2fe..a318c67 100644
--- a/drivers/vbus/bus-proxy.c
+++ b/drivers/vbus/bus-proxy.c
@@ -115,7 +115,7 @@ static ssize_t _show_modalias(struct device *dev,
 {
 	return sprintf(buf, "vbus-proxy:%s\n", to_dev(dev)->type);
 }
-DEVICE_ATTR(modalias, S_IRUSR | S_IRGRP | S_IROTH, _show_modalias, NULL);
+static DEVICE_ATTR(modalias, S_IRUSR | S_IRGRP | S_IROTH, _show_modalias, NULL);
 
 int vbus_device_proxy_register(struct vbus_device_proxy *new)
 {
