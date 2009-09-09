From: Avi Kivity <avi@redhat.com>
Subject: New kvm.git branch for linux-next
Date: Wed, 09 Sep 2009 20:55:18 +0300
Message-ID: <4AA7EC06.1070109@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:34068 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752572AbZIIRy6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Sep 2009 13:54:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marcelo Tosatti <mtosatti@redhat.com>, linux-next <linux-next@vger.kernel.org>, kvm-devel <kvm@vger.kernel.org>

Stephen, please pick up the 'linux-next' branch of kvm.git instead 
'master' as you do now.  This will better reflect what is actually going 
to -next, will cause fewer merge errors, and will improve -next 
bisectability.

(this is actually a symbolic ref to kvm-updates/2.6.32 which will be 
updated when kvm-updates/2.6.33 is created)

-- 
I have a truly marvellous patch that fixes the bug which this
signature is too narrow to contain.
