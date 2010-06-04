From: Sachin Sant <sachinp@in.ibm.com>
Subject: [-next June 4] Boot failure on x86_64,PPC64
Date: Fri, 04 Jun 2010 15:03:50 +0530
Message-ID: <4C08C87E.6030004@in.ibm.com>
References: <20100604153006.fa15c770.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:42770 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754650Ab0FDJdz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2010 05:33:55 -0400
In-Reply-To: <20100604153006.fa15c770.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>

Today's next failed to boot on variety of hardware (x86_64,PPC64)
with following messages :

doing fast boot

scsi_mod: module_layout: kernel tainted.

Disabling lock debugging due to kernel taint

scsi_mod: module license 'unspecified' taints kernel.

scsi_mod: Unknown symbol add_uevent_var (err 0)

scsi_mod: Unknown symbol blk_queue_rq_timed_out (err 0)

scsi_mod: Unknown symbol blk_end_request_err (err 0)

scsi_mod: Unknown symbol device_schedule_callback_owner (err 0)

scsi_mod: Unknown symbol dev_set_name (err 0)


........ <SNIP> ......

WARNING: Error iscsi_transport_sas: Unknown symbol scsi_mode_sense (err 0)

Inserting scsi_moscsi_transport_sas: Unknown symbol dev_set_name (err 0)

d (/lib/modules/scsi_transport_sas: Unknown symbol transport_remove_device (err 0)

2.6.35-rc1-autotscsi_transport_sas: Unknown symbol scsi_get_vpd_page (err 0)

est-next-2010060scsi_transport_sas: Unknown symbol device_initialize (err 0)

4/kernel/driversscsi_transport_sas: Unknown symbol device_for_each_child (err 0)

/scsi/scsi_mod.kscsi_transport_sas: Unknown symbol get_device (err 0)

o): Unknown symbscsi_transport_sas: Unknown symbol bsg_unregister_queue (err 0)

ol in module, orscsi_transport_sas: Unknown symbol transport_setup_device (err 0)

 unknown parametscsi_transport_sas: Unknown symbol put_device (err 0)

and many more scsi_mod related messages. 
Yesterday's problem of OOPS during init/load_module seem to have disappeared.

Thanks
-Sachin 


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
