From: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: block tree build failure
Date: Mon, 25 May 2009 01:38:26 -0400
Message-ID: <yq1bpphg2st.fsf@sermon.lab.mkp.net>
References: <20090525143511.f9e76bdc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:46717 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751117AbZEYFi7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2009 01:38:59 -0400
In-Reply-To: <20090525143511.f9e76bdc.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Mon, 25 May 2009 14:35:11 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>

>>>>> "Stephen" == Stephen Rothwell <sfr@canb.auug.org.au> writes:

Stephen> Caused by commit 025146e13b63483add912706c101fb0fb6f015cc
Stephen> ("block: Move queue limits to an embedded struct") from the
Stephen> block tree interacting with commit
Stephen> c8f4b88baca86491a6125cf9373a75e04b22ff8b
Stephen> ("dm-avoid-unsupported-spanning-of-md-stripe-boundaries") from
Stephen> the device-mapper tree.

Stephen> This is caused by commit
Stephen> e1defc4ff0cf57aca6c5e3ff99fa503f5943c1f1 ("block: Do away with
Stephen> the notion of hardsect_size") from the block tree interacting
Stephen> with commits cc1018ae8a413b595a1f0f822928dd9e81a75e59
Stephen> ("dm-table-ensure-targets-are-aligned-to-hardsect_size") and
Stephen> 64b184139ca6cd3d53dc45d7782c8be50b3e0331
Stephen> ("dm-table-validate-device-hardsect_size") from the
Stephen> device-mapper tree.

Bummer. I wasn't aware Alasdair had taken those patches into his DM tree
yet.  I thought he was waiting for my block layer patches to land.

The accessor function patch in my patch series was explicitly put in
place to enable changing the API without affecting users.  And we've
tried to be careful about staging these patches in the right order
throughout all the involved trees.

Sorry about the slip-up :|

-- 
Martin K. Petersen	Oracle Linux Engineering
