From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: linux-next: April 27 (iscsi_ibft)
Date: Tue, 27 Apr 2010 09:13:16 -0700 (PDT)
Message-ID: <80edf231-ef31-4f21-ab1b-1a21fda35809@default>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linux-Kernel <linux-kernel@vger.kernel.org>
Cc: Peter Jones <pjones@redhat.com>, Konrad Rzeszutek Wilk <konrad@kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

when CONFIG_ACPI is not enabled:

drivers/firmware/iscsi_ibft_find.c:112: error: dereferencing pointer to incomplete type
drivers/firmware/iscsi_ibft_find.c:112: error: dereferencing pointer to incomplete type
drivers/firmware/iscsi_ibft_find.c:112: warning: type defaults to 'int' in declaration of 'type name'
drivers/firmware/iscsi_ibft_find.c:112: error: dereferencing pointer to incomplete type
drivers/firmware/iscsi_ibft_find.c:112: warning: type defaults to 'int' in declaration of 'type name'

---
~Randy
