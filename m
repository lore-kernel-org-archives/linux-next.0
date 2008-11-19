From: Richard Holden <aciddeath@gmail.com>
Subject: pci_read_config_* functions and uninitialized warnings?
Date: Wed, 19 Nov 2008 11:15:32 -0700
Message-ID: <E749C9B9-2E83-4F54-A1C8-CBF376ECBD57@gmail.com>
Mime-Version: 1.0 (Apple Message framework v929.2)
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.228]:22066 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753864AbYKSSPf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2008 13:15:35 -0500
Received: by rv-out-0506.google.com with SMTP id k40so64795rvb.1
        for <linux-next@vger.kernel.org>; Wed, 19 Nov 2008 10:15:34 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

I'm building linux-next and seeing a lot of uninitialized warnings  
that go back to values being set using pci_read_config_* functions.  
Does anyone more familiar than I am with that code have any ideas on  
how to get GCC to realize that the pci_read_config_* initialize the  
vars. I don't want to end up submitting a lot of patches with  
uninitialized_var to fix the problems.

gcc --version: gcc (GCC) 4.1.2 (Gentoo 4.1.2 p1.1)


-Richard Holden
