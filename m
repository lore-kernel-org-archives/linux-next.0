From: Eric Paris <eparis@redhat.com>
Subject: [PATCH] secmark: fix config problem when CONFIG_NF_CONNTRACK_SECMARK
	is not set
Date: Tue, 19 Oct 2010 18:17:32 -0400
Message-ID: <20101019221732.11590.22215.stgit@paris.rdu.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jmorris@namei.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, paul.moore@hp.com, kaber@trash.net, sfr@canb.auug.org.au
List-Id: linux-next.vger.kernel.org

When CONFIG_NF_CONNTRACK_SECMARK is not set we accidentally attempt to use
the secmark fielf of struct nf_conn.  Problem is when that config isn't set
the field doesn't exist.  whoops.  Wrap the incorrect usage in the config.

Signed-off-by: Eric Paris <eparis@redhat.com>
---

 net/netfilter/nf_conntrack_netlink.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index b3c6285..146476c 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -582,9 +582,11 @@ ctnetlink_conntrack_event(unsigned int events, struct nf_ct_event *item)
 		    && ctnetlink_dump_helpinfo(skb, ct) < 0)
 			goto nla_put_failure;
 
+#ifdef CONFIG_NF_CONNTRACK_SECMARK
 		if ((events & (1 << IPCT_SECMARK) || ct->secmark)
 		    && ctnetlink_dump_secctx(skb, ct) < 0)
 			goto nla_put_failure;
+#endif
 
 		if (events & (1 << IPCT_RELATED) &&
 		    ctnetlink_dump_master(skb, ct) < 0)
