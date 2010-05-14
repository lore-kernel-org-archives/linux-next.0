From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ceph tree with Linus' tree
Date: Fri, 14 May 2010 10:07:55 +1000
Message-ID: <20100514100755.1ce0cc65.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57217 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752867Ab0ENAH4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 13 May 2010 20:07:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sage Weil <sage@newdream.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Sage,

Today's linux-next merge of the ceph tree got a conflict in
fs/ceph/messenger.c between commit
45c6ceb547ad2d98215351974a4686bf8cb13e14 ("ceph: zero unused message
header, footer fields") from Linus' tree and commit
c46c4a323cad3fb2678a6b9ffd200b7640b0dc61 ("ceph: simplify ceph_msg_new")
from the ceph tree.

I fixed it up (I think - see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ceph/messenger.c
index cd4fadb,402d9ee..0000000
--- a/fs/ceph/messenger.c
+++ b/fs/ceph/messenger.c
@@@ -1406,15 -1380,12 +1408,13 @@@ static int read_partial_message(struct 
  			con->in_base_pos = -front_len - middle_len - data_len -
  				sizeof(m->footer);
  			con->in_tag = CEPH_MSGR_TAG_READY;
 +			con->in_seq++;
  			return 0;
  		}
- 		if (IS_ERR(con->in_msg)) {
- 			ret = PTR_ERR(con->in_msg);
- 			con->in_msg = NULL;
+ 		if (!con->in_msg) {
  			con->error_msg =
  				"error allocating memory for incoming message";
- 			return ret;
+ 			return -ENOMEM;
  		}
  		m = con->in_msg;
  		m->front.iov_len = 0;    /* haven't read it yet */
@@@ -2094,15 -2061,12 +2093,15 @@@ struct ceph_msg *ceph_msg_new(int type
  	kref_init(&m->kref);
  	INIT_LIST_HEAD(&m->list_head);
  
 +	m->hdr.tid = 0;
  	m->hdr.type = cpu_to_le16(type);
 +	m->hdr.priority = cpu_to_le16(CEPH_MSG_PRIO_DEFAULT);
 +	m->hdr.version = 0;
  	m->hdr.front_len = cpu_to_le32(front_len);
  	m->hdr.middle_len = 0;
- 	m->hdr.data_len = cpu_to_le32(page_len);
- 	m->hdr.data_off = cpu_to_le16(page_off);
+ 	m->hdr.data_len = 0;
+ 	m->hdr.data_off = 0;
 -	m->hdr.priority = cpu_to_le16(CEPH_MSG_PRIO_DEFAULT);
 +	m->hdr.reserved = 0;
  	m->footer.front_crc = 0;
  	m->footer.middle_crc = 0;
  	m->footer.data_crc = 0;
