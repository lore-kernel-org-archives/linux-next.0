From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: [PowerPC][next-20190603] WARNING: at kernel/fork.c:721
Date: Tue, 4 Jun 2019 14:54:51 +0530
Message-ID: <ED78D3E2-CDCB-494F-9918-2C086F9BC158@linux.vnet.ibm.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

While booting linux-next [20190603] on a POWER9 LPAR ran into
following warning

[    9.002935] WARNING: CPU: 0 PID: 1 at kernel/fork.c:721 __put_task_struct+0x34/0x170
[    9.002947] Modules linked in: dm_mirror dm_region_hash dm_log dm_mod
[    9.002960] CPU: 0 PID: 1 Comm: systemd Not tainted 5.2.0-rc3-next-20190603-autotest #1
[    9.002971] NIP:  c0000000001191e4 LR: c00000000020c53c CTR: 0000000000000000
[    9.002980] REGS: c0000008b2783810 TRAP: 0700   Not tainted  (5.2.0-rc3-next-20190603-autotest)
[    9.002990] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24222842  XER: 20040000
[    9.003004] CFAR: c00000000020c538 IRQMASK: 0 
[    9.003004] GPR00: c00000000020c53c c0000008b2783aa0 c00000000138ca00 c0000008b92e19f8 
[    9.003004] GPR04: c0000008b2783b98 c0000008b2783b98 c0000008b92e24b0 0000000000000000 
[    9.003004] GPR08: 0000000000000000 0000000000000001 0000000000000000 c000000000a81060 
[    9.003004] GPR12: 0000000024224842 c0000000017c0000 0000000000000000 0000000000000000 
[    9.003004] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000001 
[    9.003004] GPR20: 0000000000000000 00007fff95f90000 c0000008b2756dc0 c0000008b2783df0 
[    9.003004] GPR24: 0000000000002000 c0000008ad74d200 c0000008b926a218 0000000000000000 
[    9.003004] GPR28: c0000008b92e1400 0000000000000000 0000000000000000 c0000008b92e19f8 
[    9.003083] NIP [c0000000001191e4] __put_task_struct+0x34/0x170
[    9.003094] LR [c00000000020c53c] css_task_iter_end+0x11c/0x1b0
[    9.003101] Call Trace:
[    9.003108] [c0000008b2783aa0] [c0000008b92e1400] 0xc0000008b92e1400 (unreliable)
[    9.003119] [c0000008b2783ad0] [c00000000020c53c] css_task_iter_end+0x11c/0x1b0
[    9.003129] [c0000008b2783b10] [c00000000020f60c] pidlist_array_load+0x12c/0x390
[    9.003140] [c0000008b2783bf0] [c00000000020fa20] cgroup_pidlist_start+0x1b0/0x1e0
[    9.003151] [c0000008b2783c40] [c0000000001ffd98] cgroup_seqfile_start+0x38/0x50
[    9.003163] [c0000008b2783c60] [c00000000049c270] kernfs_seq_start+0x80/0x120
[    9.003175] [c0000008b2783ca0] [c0000000003fea08] seq_read+0x208/0x540
[    9.003184] [c0000008b2783d20] [c00000000049cdd4] kernfs_fop_read+0x1a4/0x260
[    9.003196] [c0000008b2783d70] [c0000000003c3cec] __vfs_read+0x3c/0x70
[    9.003205] [c0000008b2783d90] [c0000000003c3dd4] vfs_read+0xb4/0x1b0
[    9.003214] [c0000008b2783dd0] [c0000000003c42bc] ksys_read+0x7c/0x130
[    9.003224] [c0000008b2783e20] [c00000000000b688] system_call+0x5c/0x70
[    9.003232] Instruction dump:
[    9.003237] 38423850 7c0802a6 60000000 7c0802a6 fbc1fff0 fbe1fff8 f8010010 f821ffd1 
[    9.003251] 7c7f1b78 8123067c 7d290034 5529d97e <0b090000> 81230110 7d290034 5529d97e 
[    9.003264] ---[ end trace 2194bb4cf2567482 ]—

Have not seen this warning previously and is new with this next build.

void __put_task_struct(struct task_struct *tsk)
{
        WARN_ON(!tsk->exit_state);     <<== 
        WARN_ON(refcount_read(&tsk->usage));

Since I am running into various boot failures with next tree for last week or so
am not able to bisect.

Thanks
-Sachin
