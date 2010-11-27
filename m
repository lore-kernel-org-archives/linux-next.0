From: "Scott J. Goldman" <scottjg@vmware.com>
Subject: [PATCH net-next] vmxnet3: fix compilation when RSS is disabled
Date: Sat, 27 Nov 2010 12:33:54 -0800
Message-ID: <1290890035-32285-1-git-send-email-scottjg@vmware.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-outbound-2.vmware.com ([65.115.85.73]:25163 "EHLO
	smtp-outbound-2.vmware.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753380Ab0K0Uen (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sat, 27 Nov 2010 15:34:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: pv-drivers@vmware.com, randy.dunlap@oracle.com

Since this was reported on linux-next, we may want to merge it there too.
