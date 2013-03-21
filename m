From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: Tree for Mar 20 (vmcore)
Date: Wed, 20 Mar 2013 19:49:09 -0700 (PDT)
Message-ID: <alpine.DEB.2.02.1303201945580.29880@chino.kir.corp.google.com>
References: <20130320160536.54e62fc11a3651494b710e3b@canb.auug.org.au> <5149E813.8060307@infradead.org> <alpine.DEB.2.02.1303201153330.17761@chino.kir.corp.google.com> <alpine.DEB.2.02.1303201709440.23363@chino.kir.corp.google.com>
 <20130321132012.e6f9a10287fb171dcd05c62d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130321132012.e6f9a10287fb171dcd05c62d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, HATAYAMA Daisuke <d.hatayama@jp.fujitsu.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kexec@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Thu, 21 Mar 2013, Stephen Rothwell wrote:

> What exactly are "these patches" so that I can remove them from my copy
> of the mmotm tree (assuming that Andrew does not get a new mmotm released
> in the next hour or so).
> 

[nacked] vmcore-reference-e_phoff-member-explicitly-to-get-position-of-program-header-table.patch
[nacked] vmcore-clean-up-by-removing-unnecessary-variable.patch
[nacked] vmcore-rearrange-program-headers-without-assuming-consequtive-pt_note-entries.patch
[nacked] vmcore-sysfs-export-elf-note-segment-size-instead-of-vmcoreinfo-data-size.patch
[nacked] vmcore-allocate-buffer-for-elf-headers-on-page-size-alignment.patch
[nacked] vmcore-round-up-buffer-size-of-elf-headers-by-page_size.patch
[nacked] vmcore-procfs-introduce-a-flag-to-distinguish-objects-copied-in-2nd-kernel.patch
[nacked] vmcore-copy-non-page-size-aligned-head-and-tail-pages-in-2nd-kernel.patch
[nacked] vmcore-modify-vmcore-clean-up-function-to-free-buffer-on-2nd-kernel.patch
[nacked] vmcore-clean-up-read_vmcore.patch
[nacked] vmcore-read-buffers-for-vmcore-objects-copied-from-old-memory.patch
[nacked] vmcore-allocate-per-cpu-crash_notes-objects-on-page-size-boundary.patch
[nacked] kexec-allocate-vmcoreinfo-note-buffer-on-page-size-boundary.patch
[nacked] kexec-elf-introduce-nt_vmcore_debuginfo-note-type.patch
[nacked] elf-introduce-nt_vmcore_pad-type.patch
[nacked] kexec-fill-note-buffers-by-nt_vmcore_pad-notes-in-page-size-boundary.patch
[nacked] vmcore-check-nt_vmcore_pad-as-a-mark-indicating-the-end-of-elf-note-buffer.patch
[nacked] vmcore-check-if-vmcore-objects-satify-mmaps-page-size-boundary-requirement.patch
[nacked] vmcore-round-up-offset-of-vmcore-object-in-page-size-boundary.patch
[nacked] vmcore-count-holes-generated-by-round-up-operation-for-vmcore-size.patch
[nacked] vmcore-introduce-mmap_vmcore.patch
