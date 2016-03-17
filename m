From: Nishanth Menon <nm@ti.com>
Subject: [cocci: new build warnings]: next-20160316 setup_timer.cocci
Date: Wed, 16 Mar 2016 19:06:16 -0500
Message-ID: <56E9F4F8.70708@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:39303 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934546AbcCQAGa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 Mar 2016 20:06:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vaishali Thakkar <vaishali.thakkar@oracle.com>, Michal Marek <mmarek@suse.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, linux-next@vger.kernel.org, cocci@systeme.lip6.fr

Hi,

It looks like commit c5eda8fd10c6 ("Coccinelle: Add
api/setup_timer.cocci") with spatch rev(1.0.4 latest)[1] generates
warning [2]. I am using spatch from the latest git tree[3]

rule name: parse error:
  File "./scripts/coccinelle/api/setup_timer.cocci", line 109, column 0,
charpos = 1939
  around = '(',
  whole content = '(context || org || report)@'

[1]
spatch byte-code version 1.0.4-00203-gdb45d7549bdd compiled with OCaml
version 4.01.0
Flags passed to the configure script: [none]
Python scripting support: yes
Syntax of regular expresssions: PCRE

[2] http://pastebin.ubuntu.com/15405226/
[3] https://github.com/coccinelle/coccinelle.git

-- 
Regards,
Nishanth Menon
