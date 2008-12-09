From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: next-20081209: fail to build ia64/kvm
Date: Tue, 9 Dec 2008 16:09:49 +0300
Message-ID: <a4423d670812090509q4d3dbe15h780ec3f4f11d1b3c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.29]:25896 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752730AbYLINJu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 08:09:50 -0500
Received: by yx-out-2324.google.com with SMTP id 8so668438yxm.1
        for <linux-next@vger.kernel.org>; Tue, 09 Dec 2008 05:09:49 -0800 (PST)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, anthony.xu@intel.com, xiantao.zhang@intel.com, kvm-ia64@vger.kernel.org

arch/ia64/kvm/kvm-ia64.c: In function 'kvm_relocate_vmm':
arch/ia64/kvm/kvm-ia64.c:1547: error: dereferencing pointer to incomplete type
arch/ia64/kvm/kvm-ia64.c:1548: error: dereferencing pointer to incomplete type
